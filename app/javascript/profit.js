function check() {
  const price = document.getElementById('item-price');
  const fee = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  price.addEventListener("input", function(){
    const inputPrice = document.getElementById("item-price").value;
    fee.innerHTML = Math.floor(inputPrice * 0.1);
    profit.innerHTML = Math.floor(inputPrice * 0.9);
   });
  };

  window.addEventListener("load", check);

  console.log('OK')