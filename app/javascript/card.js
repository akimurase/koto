const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    // modelメッソドを使ってインスタン変数に代入した場合はこちら。eventの中の[]の値を取得
    const card = {
      number: formData.get("event[number]"),
      cvc: formData.get("event[cvc]"),
      exp_month: formData.get("event[exp_month]"),
      exp_year: `20${formData.get("event[exp_year]")}`,
    };
    // const card = {
    //   number: formData.get("demo[number]"),
    //   cvc: formData.get("demo[cvc]"),
    //   exp_month: formData.get("demo[exp_month]"),
    //   exp_year: `20${formData.get("demo[exp_year]")}`,
    // };
    // modelメッソドを使わない
      // number: formData.get("number"),
      // cvc: formData.get("cvc"),
      // exp_month: formData.get("exp_month"),
      // exp_year: `20${formData.get("exp_year")}`,
    // };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // modelメッソドを使ってインスタン変数に代入した場合はこちら
      // document.getElementById("event_number").removeAttribute("name");
      // document.getElementById("event_cvc").removeAttribute("name");
      // document.getElementById("event_exp_month").removeAttribute("name");
      // document.getElementById("event_exp_year").removeAttribute("name");
      // modelメッソドを使わない
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener("load", pay);

