import types from './types';
import { formatPostData, formatQueryString } from '../helpers';
import axios from 'axios';


const BASE_URL = 'http://localhost:8000/user_info.php';
const BASE_URL_SEARCH = 'http://localhost:8000/server/getData.php';

export function searchedRecipe(userIngredient){
    var dataToSend = formatQueryString(userIngredient);
    const resp = axios.get(BASE_URL_SEARCH, dataToSend);
    return {
        type: types.SEARCHED_RECIPE,
        payload: resp
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

export function setDetailsOfItem(details){
    return {
        type: types.DETAILS_PAGE,
        payload: details
    }
}