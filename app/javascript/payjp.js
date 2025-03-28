//= require payjp

document.addEventListener("DOMContentLoaded", function() {
  const purchaseButton = document.getElementById("purchase-btn");
  const form = document.getElementById("order-form");

  purchaseButton.addEventListener("click", function(e) {
    e.preventDefault(); // ボタンが通常の送信をしないようにする

    const numberElement = document.getElementById("card_number");
    const expiryElement = document.getElementById("card_expiry");
    const cvcElement = document.getElementById("card_cvc");

    // トークンを作成する
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        alert(response.error.message); // エラーがあれば表示
      } else {
        const token = response.id; // トークンが取得できた

        // トークンをhiddenフィールドとしてフォームに追加
        const tokenField = document.createElement("input");
        tokenField.type = "hidden";
        tokenField.name = "token";
        tokenField.value = token;

        form.appendChild(tokenField); // フォームにトークンを追加

        form.submit(); // フォームを送信
      }
    });
  });
});
