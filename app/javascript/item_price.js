const price = () => {
  
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        profitDom.innerHTML = Math.ceil(inputValue - inputValue * 0.1).toLocaleString();
    })
  };
  window.addEventListener("turbo:load", price);
  window.addEventListener("turbo:render", price);