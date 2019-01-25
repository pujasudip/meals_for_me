import types from './types';
import { formatPostData, formatQueryString } from '../helpers';
import axios from 'axios';
// const BASE_URL = '/api/userauth/login.php';
// const BASE_URL_SEARCH = '/api/server/getData.php';
// //http://localhost:8000/api/server/getData.php';
// const BASE_URL_SIGNUP = '/api/userauth/createuser.php';
// const BASE_URL_RECIPE_SEARCH = '/api/server/getRecipe.php';
// const FAV_URL_ADD = '/api/server/addFavorites.php';
// const FAV_URL_GET = '/api/server/getFavorites.php';
// const FAV_URL_DEL = '/api/server/deleteFavorite.php';
// const ADD_TO_SHOPPINGLIST = '/api/server/shoppingList.php';
// const DEL_FROM_SHOPPINGLIST = '/api/server/del_shoppingList.php';
// const STATUS_SHOPPINGLIST = '/api/server/shoppingStatus.php';

const BASE_URL = 'http://localhost:8000/userauth/login.php';
const BASE_URL_SEARCH = 'http://localhost:8000/server/getData.php';
const BASE_URL_SIGNUP = 'http://localhost:8000/userauth/createuser.php';
const BASE_URL_RECIPE_SEARCH = 'http://localhost:8000/server/getRecipe.php';
const FAV_URL_ADD = 'http://localhost:8000/server/addFavorites.php';
const FAV_URL_GET = 'http://localhost:8000/server/getFavorites.php';
const FAV_URL_DEL = 'http://localhost:8000/server/deleteFavorite.php';
const ADD_TO_SHOPPINGLIST = 'http://localhost:8000/server/shoppingList.php';
const DEL_FROM_SHOPPINGLIST = 'http://localhost:8000/server/del_shoppingList.php';
const STATUS_SHOPPINGLIST = 'http://localhost:8000/server/shoppingStatus.php';


export function searchedRecipe(userIngredient, page){
    var dataToSend = formatQueryString(userIngredient, page);
    const resp = axios.get(BASE_URL_SEARCH, dataToSend);
    return {
        type: types.SEARCHED_RECIPE,
        payload: resp
    }
}

export function clearSearchedRecipe(){
    return {
        type: types.CLEAR_SEARCHED_RECIPE,
    }
}

export function userLogin(username, password){
    const dataToSend = formatPostData({username: username, password: password});
    const response = axios.post(`${BASE_URL}`, dataToSend);

    return {
        type: types.LOGIN,
        payload: response
    }
}

export function userLogout(){
    return {
        type: types.USER_LOGOUT
    }
}

export function addIngredeints(ingredient){
    return {
        type: types.ADD_INGREDIENT,
        payload: ingredient
    }
}

export function removeIngredients(index){
    return {
        type: types.REMOVE_INGREDIENT,
        payload: index
    }
}

export function clearUserIngredientInputs(){
    return {
        type: types.CLEAR_USER_INGREDIENT_INPUTS,
        payload: []
    }
}

export function getDetailsById(id){
    var dataToSend = {params: {
        'id': id
    }};
    const resp = axios.get(BASE_URL_RECIPE_SEARCH, dataToSend);
    return {
        type: types.DETAILS_PAGE,
        payload: resp
    }
}


export function addToShoppingList(item) {
    return {
        type: types.ADD_TO_SHOPPINGLIST,
        payload: item
    }
}

export function removeFromShoppingList(item){
    return {
        type: types.REMOVE_FROM_SHOPPINGLIST,
        payload: item
    }
}

export function createUserAccount(values){
    const { firstName, lastName, username, email, password} = values;
    const dataToSend = formatPostData({firstName, lastName, username, email, password});
    const response = axios.post(`${BASE_URL_SIGNUP}`, dataToSend);
    return {
        type: types.SIGN_UP,
        payload: response
    }
}

export function addToFavorite(user_id, recipe_id){
    const dataToSend = formatPostData({user_id: user_id, recipe_id: recipe_id});
    const response = axios.post(`${FAV_URL_ADD}`, dataToSend);
    // const promise = new Promise((resolve, reject) => {
    //     const response = axios.post(`${FAV_URL_ADD}`, dataToSend)
    //         .then((response) => {
    //             resolve({user_id: user_id, recipe_id: recipe_id})
    //         });
    // })
    return {
        type: types.ADD_TO_FAVORITE,
        payload: response
    }
}

export function deleteFromFavorite(user_id, recipe_id){
    const dataToSend = formatPostData({user_id: user_id, recipe_id: recipe_id});
    var getFavData = {params: {
            user_id: user_id
        }};
    const deleteResponse = axios.post(`${FAV_URL_DEL}`, dataToSend)
        .then(() => axios.get(FAV_URL_GET, getFavData));
    // const favResp = axios.get(FAV_URL_GET, getFavData);
    return {
        type: types.DELETE_FROM_FAVORITE,
        payload: recipe_id
    }
}

export function getFavorites(user_id){
    var dataToSend = {params: {
        user_id: user_id
    }};
    const resp = axios.get(FAV_URL_GET, dataToSend);
    return {
        type: types.GET_FAVORITE,
        payload: resp
    }
}
export function setPageNo(page){
    ++page;
    return {
        type: types.SET_PAGE_NO,
        payload: page
    }
}

export function setInvalidSearch(arg=false){
    return {
        type: types.INVALID_SEARCH,
        payload: arg
    }
}

export function setLoginErrorToDefault(){
    return {
        type: types.LOGIN_DEFAULT
    }
}
export function setShoppingList(user_id, recipe_id, item, qty){
    const dataToSend = formatPostData({user_id: user_id, recipe_id: recipe_id, item: item, qty: qty});

    var getList = {params: {
            'id': user_id
        }};

    const response = axios.post(`${ADD_TO_SHOPPINGLIST}`, dataToSend)
        .then(()=>axios.get(ADD_TO_SHOPPINGLIST, getList));

    return {
        type: types.ADD_SHOPPINGLIST_SER,
        payload: response
    }
}
export function getShoppingList(user_id){
    var dataToSend = {params: {
            'id': user_id
        }};
    const response = axios.get(ADD_TO_SHOPPINGLIST, dataToSend);
    return {
        type: types.GET_SHOPPINGLIST_SER,
        payload: response
    }

}

export function deleteFromShoppingListServer(user_id, recipe_id, item, shopId){
    const dataToSend = formatPostData({user_id: user_id, recipe_id: recipe_id, item: item});
    var getList = {params: {
            'id': user_id
        }};

    const response = axios.post(`${DEL_FROM_SHOPPINGLIST}`, dataToSend)
        .then(()=>axios.get(`${ADD_TO_SHOPPINGLIST}`, getList));

    return {
        type: types.DEL_SHOPPINGLIST_SER,
        payload: response
    }
}

export function shoppingStatus(shopId, status, user_id){
    const dataToSend = formatPostData({shop_id: shopId, status: status});
    var getList = {params: {
            'id': user_id
        }};

    const response = axios.post(`${STATUS_SHOPPINGLIST}`, dataToSend)
        .then(()=>axios.get(`${ADD_TO_SHOPPINGLIST}`, getList));

    return {
        type: types.STATUS_SHOPPING,
        payload: response
    }
}

export function resetResultsPage(){
    return {
        type: types.RESET_DETAILS_PAGE,
        payload: ''
    }
}

