import $ from 'jquery'

$(document).on('turbo:load', function() {
  //復活させるダミーのcountryのセレクトボックス
  let defaultCountrySelect = `<div id="country"><div class="field"><div class="form-group"><select name="country", class="text-primary border border-gray-300 rounded-md mb-2 ml-3 w-50 p-3">
  <option value>---</option>
  </select></div></div></div>`;
  //復活させるダミーのprefectureのセレクトボックス
  let defaultPrefectureSelect = `<div id="q_prefecture_id_eq"><div class="field"><div class="form-group"><select name="prefecture", class="text-primary border border-gray-300 rounded-md mb-2 ml-3 w-50 p-3">
  <option value>都道府県 (日本のみ)</option>
  </select></div></div></div>`;
//countryの処理
$(document).on('change', '#q_country_area_id_eq', function() {
  let areaVal = $('#q_country_area_id_eq').val();
  //areaが変更されてvalueに値が入った場合の処理
  if (areaVal !== "") {
    let selectedTemplate = $(`#country_${areaVal}`); //呼び出すtemplateのidセット
    $('#q_country_id_eq').remove(); //デフォルト表示用のcountryを削除
    $('#q_prefecture_id_eq').remove(); //デフォルト表示用のprefectureを削除
    $("#selected_country").remove(); //前に選択したcountryがある場合に削除
    $("#selected_prefecture").remove();  //前に選択したprefectureがある場合に削除（これがないと、country, prefectureが選択された状態で、areaが変更された場合にprefectureが残ってしまう。）
    $('#country_insert_point').after(selectedTemplate.html()); //areaに紐づいたcountryセレクトを追加
    $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  }else {
    //親要素のセレクトボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
    $("#selected_country").remove();//前に選択したcountryがある場合に削除
    $("#selected_prefecture").remove(); //前に選択したprefectureがある場合に削除
    $('#q_country_id_eq').remove();//デフォルト表示用のcountryを削除
    $('#q_prefecture_id_eq').remove(); //デフォルト表示用のprefectureを削除
    $('#prefecture_insert_point').after(defaultCOuntrySelect); //デフォルト表示のcountryを追加
    $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  };
});
//prefectureの処理
$(document).on('change', '#q_country_id_eq', function() {
  let areaVal = $('#q_country_id_eq').val();
  //親要素のセレクトボックスが変更されてvalueに値が入った場合の処理
  if (areaVal !== "") {
    let selectedTemplate = $(`#prefecture_${areaVal}`);
   //デフォルトで入っていた子要素のセレクトボックスを削除
  $("#selected_prefecture").remove();//前に選択したprefectureがある場合に削除
   $('#q_prefecture_id_eq').remove(); //デフォルト表示のprefectureを追加
   // $('#before_country_select_box').remove();
   $('#prefecture_insert_point').after(selectedTemplate.html()); //countryに紐づいたprefectureセレクトを追加
  }else {
  $('#q_prefecture_id_eq').remove();
   $("#selected_prefecture").remove(); //前に選択したprefectureを削除
   $('#prefecture_insert_point').after(defaultPrefectureSelect); //デフォルト表示のprefectureを追加
  };
});

});


/*
$(document).on('turbo:load', function() {
  //HTMLが読み込まれた時の処理
  let areaVal = $('#q_country_area_id_eq').val();
  //一度目に検索した内容が検索ボックスに残っている時用のif文
  if (areaVal !== "") {
    let selectedTemplate = $(`#country-area${areaVal}`);
    $('#q_country_id_eq').remove();
    $('#q_country_area_id_eq').after(selectedTemplate.html());
  };

  //もともとある子要素用の検索ボックスのHTML
  let defaultCountrySelect = `<select , class="text-primary border border-gray-300 w-40 rounded-md mb-2 ml-3 w-40 p-2" name="q[country_id_eq]" id="q_country_id_eq">
  <option value>国</option>
  </select>`;

  $(document).on('change', '#q_country_area_id_eq', function() {
    let areaVal = $('#q_country_area_id_eq').val();
   //親要素の検索ボックスが変更されてvalueに値が入った場合の処理
    if (areaVal !== "") {
      let selectedTemplate = $(`#country-area${areaVal}`);
      //デフォルトで入っていた子要素の検索ボックスを削除
      $('#q_country_id_eq').remove();
      $('#q_country_area_id_eq').after(selectedTemplate.html());
    }else {
      //親要素の検索ボックスが変更されてvalueに値が入っていない場合（include_blankの部分を選択している場合）
      $('#q_country_id_eq').remove();
      $('#q_country_area_id_eq').after(defaultCountrySelect);
    };
  });
});
*/