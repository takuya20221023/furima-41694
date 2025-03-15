document.addEventListener('DOMContentLoaded', function () {
  const priceInput = document.getElementById('item-price');
  const commissionElement = document.getElementById('add-tax-price');
  const profitElement = document.getElementById('profit');

  const calculateCommissionAndProfit = (price) => {
    const commission = price * 0.1;
    const profit = price - commission;
    return { commission, profit };
  };

  priceInput.addEventListener('input', function () {
    const price = parseInt(priceInput.value, 10);

    if (isNaN(price) || price <= 0) {
      commissionElement.textContent = '¥0';
      profitElement.textContent = '¥0';
      return;
    }

    const { commission, profit } = calculateCommissionAndProfit(price);

    commissionElement.textContent = `¥${commission.toLocaleString()}`;
    profitElement.textContent = `¥${profit.toLocaleString()}`;
  });
});
