
function sum(list) {
  var sum = 0;
  for(var i = 0;i < list.length;i++){
    sum = sum + parseInt(list[i], 10);
  }
  return sum;
}

module.exports = sum;
