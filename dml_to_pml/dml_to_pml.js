var fs = require('fs');
var libxmljs = require("libxmljs");

function transformFile(inputFile, rootNodeName, outputFile) {
  var parser = new libxmljs.SaxParser();

  var docStack = [];
  var doc;

  parser.on('startElementNS', function(elem, attrs, prefix, uri, namespace) {
    var as = {};
    attrs.forEach(function(attr) {
      as[attr[0]] = attr[3];
    });
    var parent = docStack[docStack.length - 1];
    var node = {
      type_name: elem,
      attributes: as,
      text: '',
      children: []
    }
    if (parent) parent.children.push(node);
    docStack.push(node);
  });
  parser.on('endElementNS', function(elem) {
    doc = docStack.pop();
  });
  parser.on('characters', function(chars) {
    docStack[docStack.length - 1].text += chars;
  });

  parser.parseString(fs.readFileSync(inputFile).toString());


  function getMember(dmlEntity, member) {
    return dmlEntity.children.filter(function(x) { return x.attributes.name == member })[0];
  }

  function dmlEntityToPmlEntity(dmlEntity) {
    var t = dmlEntity.attributes.type.split(',')[0].split('.');
    var dmlChildrenNode = getMember(dmlEntity, 'Entity+children');

    var attrs = {};

    var dmlTranslationNode = getMember(dmlEntity, 'Entity+translation');
    if (dmlTranslationNode.attributes.cast == 'object') {
      attrs.translation = '{' +
        ' x: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+X').text) +
        ', y: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+Y').text) +
        ', z: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+Z').text) +
      ' }';
    }

    var dmlRotationNode = getMember(dmlEntity, 'Entity+rotation');
    if (dmlRotationNode.attributes.cast == 'object') {
      attrs.rotation = '{' +
        ' x: ' + parseFloat(getMember(dmlRotationNode, 'Quaternion+X').text) +
        ', y: ' + parseFloat(getMember(dmlRotationNode, 'Quaternion+Y').text) +
        ', z: ' + parseFloat(getMember(dmlRotationNode, 'Quaternion+Z').text) +
        ', w: ' + parseFloat(getMember(dmlRotationNode, 'Quaternion+W').text) +
      ' }';
    }

    var dmlScaleNode = getMember(dmlEntity, 'Entity+scale');
    if (dmlScaleNode.attributes.cast == 'object') {
      attrs.scale = '{' +
        ' x: ' + parseFloat(getMember(dmlScaleNode, 'Vector3+X').text) +
        ', y: ' + parseFloat(getMember(dmlScaleNode, 'Vector3+Y').text) +
        ', z: ' + parseFloat(getMember(dmlScaleNode, 'Vector3+Z').text) +
      ' }';
    }
    return {
      type_name: t[t.length - 1],
      attributes: attrs,
      children: dmlChildrenNode ? dmlChildrenNode.children.map(dmlEntityToPmlEntity) : []
    }
  }

  var root = dmlEntityToPmlEntity(doc.children[0].children.filter(function(x) { return x.attributes.name == rootNodeName })[0]);

  function toXml(node, entity) {
    var n = node.node(entity.type_name);
    n.attr(entity.attributes);
    entity.children.forEach(function(e) {
      toXml(n, e);
    });
  }
  var doc = new libxmljs.Document();
  toXml(doc.node('Pml'), root);

  fs.writeFileSync(outputFile, doc.toString());
}

transformFile('../../LevelA/static.xml', 'MapStaticData+SceneRoot', '../levela.static.pml')
transformFile('../../LevelA/dynamic.xml', 'MapDynamicData+SceneRoot', '../levela.dynamic.pml')
