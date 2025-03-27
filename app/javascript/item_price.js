document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const taxPriceDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  priceInput.addEventListener('input', function() {
    const price = parseFloat(priceInput.value);
    if (isNaN(price)) {
      taxPriceDisplay.textContent = '';
      profitDisplay.textContent = '';
      return;
    }

    // 価格が入力されていれば計算を実行
    const tax = price * 0.1;  // 販売手数料（10%）
    const profit = price - tax;  // 販売利益

    // 表示を更新
    taxPriceDisplay.textContent = Math.floor(tax);  // 手数料
    profitDisplay.textContent = Math.floor(profit);  // 利益
  });
});