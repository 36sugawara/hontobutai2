import $ from 'jquery'
//$("#hoge").css("color","red")

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