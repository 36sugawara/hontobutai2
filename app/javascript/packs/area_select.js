import $ from 'jquery'
$(document).on('turbo:load', function() {
  //復活させるダミーのcountryのセレクトボックス
  let defaultCountrySelect = `<div id="country"><div class="field"><div class="form-group"><select name="country", class="form-control border border-gray-300 rounded-md p-2 mb-3">
  <option value>---</option>
  </select></div></div></div>`;
  //復活させるダミーのprefectureのセレクトボックス
  let defaultPrefectureSelect = `<div id="prefecture"><div class="field"><div class="form-group"><select name="prefecture", class="form-control border border-gray-300 rounded-md p-2 mb-3">
  <option value>都道府県を選択 (日本のみ)</option>
  </select></div></div></div>`;
//countryの処理
$(document).on('change', '#book_area_id', function() {
  let areaVal = $('#book_area_id').val();
  //areaが変更されてvalueに値が入った場合の処理
  if (areaVal !== "") {
    let selectedTemplate = $(`#country_${areaVal}`); //呼び出すtemplateのidセット
    $('#country').remove(); //デフォルト表示用のcountryを削除
    $('#prefecture').remove(); //デフォルト表示用のprefectureを削除
    $("#selected_country").remove(); //前に選択したcountryがある場合に削除
    $("#selected_prefecture").remove();  //前に選択したprefectureがある場合に削除（これがないと、country, prefectureが選択された状態で、areaが変更された場合にprefectureが残ってしまう。）
    $('#country_insert_point').after(selectedTemplate.html()); //areaに紐づいたcountryセレクトを追加
    $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  }else {
    //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
    $("#selected_country").remove();//前に選択したcountryがある場合に削除
    $("#selected_prefecture").remove(); //前に選択したprefectureがある場合に削除
    $('#country').remove();//デフォルト表示用のcountryを削除
    $('#prefecture').remove(); //デフォルト表示用のprefectureを削除
    $('#prefecture_insert_point').after(defaultCOuntrySelect); //デフォルト表示のcountryを追加
    $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  };
});
//prefectureの処理
$(document).on('change', '#book_country_id', function() {
  let areaVal = $('#book_country_id').val();
  //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
  if (areaVal !== "") {
    let selectedTemplate = $(`#prefecture_${areaVal}`);
   //デフォルトで入っていた子要素のセレクトボックスを削除
  $("#selected_prefecture").remove();//前に選択したprefectureがある場合に削除
   $('#prefecture').remove(); //デフォルト表示のprefectureを追加
   // $('#before_country_select_box').remove();
   $('#prefecture_insert_point').after(selectedTemplate.html()); //countryに紐づいたprefectureセレクトを追加
  }else {
  $('#prefecture').remove();
   $("#selected_prefecture").remove(); //前に選択したprefectureを削除
   $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  };
});

});

/*
$(document).on('turbo:load', function() {
  //HTMLが読み込まれた時の処理
  let areaVal = $('#book_area_id').val();
  //一度目に検索した内容がセレクトボックスに残っている時用のif文
  if (areaVal !== "") {
    let selectedTemplate = $(`#country-of-area${areaVal}`);
    $('#book_country_id').remove();
    $('#book_area_id').after(selectedTemplate.html());
  };

  //もともとある子要素用のセレクトボックスのHTML
  let defaultCountrySelect = `<select , class="border border-gray-300 rounded-md p-2" name="book[country]" id="book_country_id">
  <option value>国を選択</option>
  </select>`;

  $(document).on('change', '#book_area_id', function() {
    let areaVal = $('#book_area_id').val();
   //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
    if (areaVal !== "") {
      let selectedTemplate = $(`#country-of-area${areaVal}`);
      //デフォルトで入っていた子要素のセレクトボックスを削除
      $('#book_country_id').remove();
      $('#book_area_id').after(selectedTemplate.html());
    }else {
      //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
      $('#book_country_id').remove();
      $('#book_area_id').after(defaultCountrySelect);
    };
  });
});
*/