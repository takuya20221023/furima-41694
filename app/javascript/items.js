(() => {
  const price = () => {
    const priceInput = document.getElementById("item-price");
    const commissionElement = document.getElementById("add-tax-price");
    const profitElement = document.getElementById("profit");

    // 要素が見つからない場合は処理を中止
    if (!priceInput || !commissionElement || !profitElement) return;

    const calculateCommissionAndProfit = (price) => {
      const commission = Math.floor(price * 0.1); // 販売手数料 (10%)
      const profit = price - commission; // 販売利益
      return { commission, profit };
    };

    const updatePrices = () => {
      const price = parseInt(priceInput.value, 10);

      if (isNaN(price) || price < 300 || price > 9999999) {
        commissionElement.textContent = "0";
        profitElement.textContent = "0";
        return;
      }

      const { commission, profit } = calculateCommissionAndProfit(price);
      commissionElement.textContent = commission.toLocaleString(); // カンマ区切り
      profitElement.textContent = profit.toLocaleString();
    };

    // イベントリスナーの重複を防ぐ
    priceInput.removeEventListener("input", updatePrices);
    priceInput.addEventListener("input", updatePrices);
  };

  // Turbo に対応（ページ遷移時の動作を保証）
  document.removeEventListener("turbo:load", price);
  document.addEventListener("turbo:load", price);
  document.removeEventListener("turbo:render", price);
  document.addEventListener("turbo:render", price);
})();
