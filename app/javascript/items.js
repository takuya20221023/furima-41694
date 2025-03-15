const price = () => {
  const priceInput = document.getElementById('item-price');
  const commissionElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  if (!priceInput) return; // フォームがないページでは処理しない

  const calculateCommissionAndProfit = (price) => {
    const commission = Math.floor(price * 0.1); // 販売手数料を切り捨て
    const profit = Math.floor(price - commission); // 販売利益を切り捨て
    return { commission, profit };
  };

  const updatePrices = () => {
    const price = parseInt(priceInput.value, 10);

    if (isNaN(price) || price < 300 || price > 9999999) { 
      // 価格が範囲外の場合は0を表示
      commissionElement.textContent = '0';
      profitElement.textContent = '0';
      return;
    }

    const { commission, profit } = calculateCommissionAndProfit(price);
    commissionElement.textContent = commission.toLocaleString(); // カンマ区切りで表示
    profitElement.textContent = profit.toLocaleString(); // カンマ区切りで表示
  };

  priceInput.addEventListener('input', updatePrices);
};

// Turboイベントに対応
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
