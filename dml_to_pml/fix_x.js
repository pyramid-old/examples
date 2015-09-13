
var fs = require('fs');
var file = require('file');
var path = require('path');

file.walk("../assets/DeadMeetsLeadContent", function(err, dirPath, dirs, files) {
  files.forEach(function(filename) {
    if (path.extname(filename) !== ".x") return;
    console.log(filename);
    var content = fs.readFileSync(filename).toString();
    content = content.replace(/AnimationKey {([^}]*)}/g, function(match, p1, offset, string) {
      var rows = p1.split('\n');
      var type = parseInt(rows[1].split(";")[0].trim());
      if (type == 1 || type == 2) {
        rows = rows.map(function(r) {
          var vs = r.split(";");
          if (vs[1] == "4") {
            vs[1] = "3";
            return vs.join(";");
          } else {
            return r;
          }
        });
      }
      return 'AnimationKey {' + rows.join('\n') + '}';
    });
    content = content.replace(/SkinWeights {([^}]*)}/g, function(match, p1, offset, string) {
      var x = p1.split(';');
      if (x[1].trim() == '0') {
        return '';
      } else {
        return 'SkinWeights {' + p1 + '}';
      }
    });
    fs.writeFileSync(filename, content);
  });
});
