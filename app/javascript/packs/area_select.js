import $ from 'jquery'

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