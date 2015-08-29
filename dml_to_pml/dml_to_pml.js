var fs = require('fs');
var libxmljs = require("libxmljs");

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

parser.parseString(fs.readFileSync('../examples/LevelA/static.xml').toString());


function getMember(dmlEntity, member) {
  return dmlEntity.children.filter(function(x) { return x.attributes.name == member })[0];
}

function dmlEntityToPmlEntity(dmlEntity) {
  var t = dmlEntity.attributes.type.split(',')[0].split('.');
  var dmlChildrenNode = getMember(dmlEntity, 'Entity+children');
  var dmlTranslationNode = getMember(dmlEntity, 'Entity+translation');
  var attrs = {};
  if (dmlTranslationNode.attributes.cast == 'object') {
    attrs.translation = '{' +
      ' x: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+X').text) +
      ', y: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+Y').text) +
      ', z: ' + parseFloat(getMember(dmlTranslationNode, 'Vector3+Z').text) +
    ' }';
  }
  return {
    type_name: t[t.length - 1],
    attributes: attrs,
    children: dmlChildrenNode ? dmlChildrenNode.children.map(dmlEntityToPmlEntity) : []
  }
}

var root = dmlEntityToPmlEntity(doc.children[0].children.filter(function(x) { return x.attributes.name == 'MapStaticData+SceneRoot' })[0]);

function toXml(node, entity) {
  var n = node.node(entity.type_name);
  n.attr(entity.attributes);
  entity.children.forEach(function(e) {
    toXml(n, e);
  });
}
var doc = new libxmljs.Document();
toXml(doc.node('Pml'), root);

fs.writeFileSync('../levela.pml', doc.toString());
