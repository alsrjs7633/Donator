
$(function(){
  $("#check_all").click(function(){
      var chk = $(this).is(":checked");//.attr('checked');
      if(chk) $("input[name=card_check]:checkbox").prop("checked", true);
      else  $("input[name=card_check]:checkbox").prop("checked", false);
  });
  $("#check_del").click(function(){
    $("input[name=card_check]:checkbox")  //체크한부분 삭제  
  })
});