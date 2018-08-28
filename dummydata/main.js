$(document).ready(initializeApp);

function initializeApp(){
    clickHandlers();
}
function clickHandlers(){
    $('.submitFood').click(function(){
        var foodItem = $('.input').val();
        dummyData(foodItem);
    })

    $('.submitId').click(function(){
        var foodId = $('.inputId').val();
        foodRecipe(foodId);
    })
}


function dummyData(fooditem) {
    var foodApi = {
        url: 'https://www.themealdb.com/api/json/v1/1/filter.php?i=' + fooditem,
        dataType: 'json',
        method: 'get',
        data: {
        
        },
        success: function (response) {
            console.log(response);
        },
        error: function () {
            console.log('error')
        }
    }
    $.ajax(foodApi);
}


function foodRecipe(foodid) {
    var foodId = {
        url: 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + foodid,
        dataType: 'json',
        method: 'get',
        data: {
        
        },
        success: function (response) {
            console.log(response);
        },
        error: function () {
            console.log('error')
        }
    }
    $.ajax(foodId);
}