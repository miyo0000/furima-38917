const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);
  const elements = payjp.elements();
  
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');


  numberElement.mount('#card-number');
  expiryElement.mount('#card-exp-month');
  cvcElement.mount('#card-cvc');


  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
        // エラーが発生した場合の処理
      } else {
        const token = response.id;
        
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input type="hidden" value=${token} name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // 生成されたトークンをサーバーに送信して決済処理などを行う
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);