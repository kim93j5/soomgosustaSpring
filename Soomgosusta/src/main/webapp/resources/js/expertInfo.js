$(document).ready(function() {
    $("#select_Question").css('display','none');
    $("#select_Answer").css('display','none');
    $('#select_District').css('display', 'none');
    $('.detailPart1').css('display', 'none');
    $('.detailPart2').css('display', 'none');
    
    $('#next4').click(function(){
        $("#select_Question").css('display','none');
         $("#select_Answer").css('display','none');
         $('#select_District').css('display', 'block');
         $('#hidden').css('display', 'block');
         
    });
    
   $('#district_select2').css('display', 'none');
   $('#district_select3').css('display', 'none');
   $('#addDistrict1').click(function() {
      $('#district_select2').css('display', 'block');
   });

   $('#addDistrict2').click(function() {
      $('#district_select3').css('display', 'block');
   });
   
   $('#prev5').click(function(){
       $('#select_District').css('display', 'none');
       $('#select_Question').css('display', 'block');
       $('#select_Answer').css('display', 'block');
   });
   
   $('#prev4').click(function(){
      $('.part').css('display', 'block');
      $('#select_Question').css('display', 'none');
      $('#select_Answer').css('display', 'none');
      $("#first_select_SWord").css('display','block');   
   });
   

});


var expertInfoService = (function(){
   function getMWords(LWord, callback, error){
      /*$.getJSON("/member/addInfo/"+LWord+".json",function(data){
         if(callback){
            callback(data);
         }
      });*/
      console.log(LWord);
      $.ajax({
         type : 'get',
         url : '/expert/listExpertInfo/'+LWord,
         data : JSON.stringify(LWord),
         contentType : "application/json; charset=utf-8",
         success : function(result,status,xhr){
            if(callback) {
               callback(result);
            }
         },
         error : function(xhr,status,er){
            if(error){
               error(er);
            }
         }
      })
      
   }
   
   function getSWords(LWord, MWord, callback, error){
      console.log(LWord);
      console.log(MWord);
      $.ajax({
         type : 'get',
         url : '/expert/listExpertInfo/'+LWord+"/"+MWord,
         data : JSON.stringify(MWord),
         contentType : "application/json; charset=utf-8",
         success : function(result,status,xhr){
            if(callback) {
               callback(result);
            }
         },
         error : function(xhr,status,er){
            if(error){
               error(er);
            }
         }
      })
      
   }
   
   return {
      getMWords : getMWords,
      getSWords : getSWords
   };
})();