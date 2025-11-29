import { createAsyncThunk } from "@reduxjs/toolkit";
import axios, { AxiosError } from "axios";

const runtimeBackend =
  window?.runtimeConfig?.BACKEND_URL &&
  window.runtimeConfig.BACKEND_URL.trim() !== ""
    ? window.runtimeConfig.BACKEND_URL
    : null;

// Fallback to build-time .env (Vite)
const viteBackend = import.meta.env.VITE_BACKEND_URL || "";

// Final backend URL
export const backendURL = runtimeBackend || viteBackend;

export const fetchAllKitchenOrders = createAsyncThunk(
  "kitchen/fetchAllOrders",
  async (_, { rejectWithValue }) => {
    try {
      const response = await axios.get(`${backendURL}/api/v1/kitchen/all`, {
        withCredentials: true,
      });
      return response.data;
    } catch (err) {
      if (err instanceof AxiosError && err.response) {
        return rejectWithValue(err.response.data);
      }
      return rejectWithValue("Failed to fetch kitchen orders");
    }
  }
);

export const prepareItem = createAsyncThunk(
  "kitchen/prepareItem",
  async (
    data: { orderNo: string; tableNo: string; sNo: number; ItemCode: string },
    { rejectWithValue }
  ) => {
    try {
      const response = await axios.post(
        `${backendURL}/api/v1/kitchen/changeItemStatus`,
        { ...data, status: "Prepared" },
        {
          withCredentials: true,
        }
      );
      return response.data;
    } catch (err) {
      if (err instanceof AxiosError && err.response) {
        return rejectWithValue(err.response.data);
      }
      return rejectWithValue("Failed to prepare item");
    }
  }
);
