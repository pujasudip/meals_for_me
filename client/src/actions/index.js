import types from './types';
import { formatPostData } from '../helpers';
import axios from 'axios';


const BASE_URL = 'http://localhost:8000/user_info.php';

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

export function checkLoginStatus(){
    const response = axios.post(`${BASE_URL}`);
    console.log('status:', response);
    return {
        type: types.LOGIN_STATUS,
        payload: response
    }
}