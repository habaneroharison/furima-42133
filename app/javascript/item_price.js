document.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item-price"); // 金額入力欄
  const taxDisplay = document.getElementById("add-tax-price"); // 販売手数料
  const profitDisplay = document.getElementById("profit"); // 販売利益

  if (priceInput) { // nullチェック
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      // 数値に変換し、手数料（10%）と利益（90%）を計算
      const price = parseInt(inputValue, 10);
      if (!isNaN(price)) {
        const tax = Math.floor(price * 0.1); // 小数点以下切り捨て
        const profit = price - tax;

        // 手数料と利益を表示
        taxDisplay.textContent = tax.toLocaleString();
        profitDisplay.textContent = profit.toLocaleString();
      } else {
        // 入力が空または数値以外の場合はリセット
        taxDisplay.textContent = "0";
        profitDisplay.textContent = "0";
      }

      console.log(`入力金額: ${inputValue}, 手数料: ${taxDisplay.textContent}, 利益: ${profitDisplay.textContent}`);
    });
  }
});