function total_bill(bill_list) {

  var total = 0;
  for(var i = 0;i < bill_list.length;i ++){
   //  console.log(bill_list[i]);
     for(var j = 0;j < bill_list[i].length;j ++){
        var price = bill_list[i][j]['price'].slice(1);
      //  console.log(price);
        total = +total + +price;
     }
  }
  
  //console.log(total);
  return total;
}

module.exports = total_bill;
