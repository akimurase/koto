const price = function () {
  const totalPrice = document.getElementById("total_price");
  const onePrice = document.getElementById("one_price");

  // ------<人数を選択した時の計算>
  const selectNum = document.getElementById("num");
    selectNum.addEventListener('change', function (){
      // numのdata属性の値を取る
      const numSelectBox = document.getElementById("num");
      const dataNum = numSelectBox.options[ numSelectBox.selectedIndex].getAttribute("data-multiple");
      // 一人料金のidを取得
      const priceOne = document.getElementById("one_price");
      //idを数字にする
      const displayPriceOne = priceOne.innerHTML;
      //カンマを削除
      const displayPriceOneInteger = Number( displayPriceOne.replace(/,/, '') );
      // 計算する
      const total = (displayPriceOneInteger*dataNum);
      // 取得した合計金額をフォームに入力
      document.getElementById("f_price").value = total;
      // 正規表現でカンマ区切りにする
      const totalComma = total.toLocaleString('ja-JP');
      // 表示する
      totalPrice.innerHTML = totalComma;
    });
}



window.addEventListener("load", price);
