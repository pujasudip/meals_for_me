import types from './types';
import { formatPostData } from '../helpers';
import axios from 'axios';


const BASE_URL = 'http://localhost:8000/login.php';

export function searchIngredient(){
    return {
        type: types.type,
        payload: 'these are the user query for search'
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