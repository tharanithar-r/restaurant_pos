/* eslint-disable @typescript-eslint/no-explicit-any */
//import { Dispatch, Action } from "@reduxjs/toolkit";
import axios from "axios";
import { clearAuth, setAuth, setAuthError, setAuthLoading } from "./authSlice";
import { getDeviceId } from "../../utils/deviceUtils";


const backendURL = import.meta.env.VITE_BACKEND_URL;

const api = axios.create({
  baseURL: backendURL,
  withCredentials: true,
  headers: {
    "Content-Type": "application/json",
  },
});

export const signIn =
  (username: string, password: string, role: "kitchen" | "waiter") =>
  async (dispatch: any) => {
    dispatch(setAuthLoading());
    try {
      // Get device ID
      const deviceId = getDeviceId();

      const apiRole = role === "kitchen" ? "user" : role;

      // Create a new axios instance with device ID header
      const authApi = axios.create({
        baseURL: backendURL,
        withCredentials: true,
        headers: {
          "Content-Type": "application/json",
          "x-device-id": deviceId,
        },
      });

      const res = await authApi.post(`${backendURL}/api/v1/${apiRole}/signin`, {
        username,
        password,
      });

      if (res.status === 200) {
        console.log("Login successful, cookie should be set");
        dispatch(setAuth({ id: username, role }));
        return true;
      } else {
        dispatch(setAuthError("Invalid credentials"));
        return false;
      }
    } catch (err: any) {
      const errorMessage =
        err.response?.data?.message || `Error during ${role} sign-in`;
      dispatch(setAuthError(errorMessage));
      return false;
    }
  };

export const signOut = () => async (dispatch: any, getState: any) => {
  dispatch(setAuthLoading());
  try {
    const { role } = getState().auth;

    let signoutEndpoint;
    if (role === "kitchen") {
      signoutEndpoint = `${backendURL}/api/v1/user/signout`;
    } else if (role === "waiter") {
      signoutEndpoint = `${backendURL}/api/v1/waiter/signout`;
    } else {
      signoutEndpoint = `${backendURL}/api/v1/waiter/signout`;
    }

    const response = await api.get(signoutEndpoint, { withCredentials: true });

    dispatch(clearAuth());

    return response.status === 200;
  } catch (err: any) {
    console.error("Signout error:", err);
    const errorMessage = err.response?.data?.message || `Error during sign-out`;
    dispatch(setAuthError(errorMessage));
    dispatch(clearAuth());
    return false;
  }
};
