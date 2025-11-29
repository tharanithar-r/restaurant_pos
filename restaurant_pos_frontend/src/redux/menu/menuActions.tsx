import { createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";

const runtimeBackend =
  window?.runtimeConfig?.BACKEND_URL &&
  window.runtimeConfig.BACKEND_URL.trim() !== ""
    ? window.runtimeConfig.BACKEND_URL
    : null;

// Fallback to build-time .env (Vite)
const viteBackend = import.meta.env.VITE_BACKEND_URL || "";

// Final backend URL
export const backendURL = runtimeBackend || viteBackend;

export const getItemByBarcode = async (barcode: string) => {
  try {
    const item = await axios.post(
      `${backendURL}/api/v1/item/barcode`,
      { barcode },
      {
        withCredentials: true,
      }
    );
    return item.data;
  } catch (err) {
    console.error("Error in getting item by Barcode: ", err);
  }
};

export const fetchCategories = createAsyncThunk(
  "menu/fetchCategories",
  async () => {
    const response = await axios.get(`${backendURL}/api/v1/menu/category`, {
      withCredentials: true,
    });
    return [{ Category: "All" }, ...response.data];
  }
);

export const fetchItems = createAsyncThunk(
  "menu/fetchItems",
  async (category: string) => {
    const response = await axios.get(
      `${backendURL}/api/v1/menu/items/${category}`,
      {
        withCredentials: true,
      }
    );
    return response.data;
  }
);
