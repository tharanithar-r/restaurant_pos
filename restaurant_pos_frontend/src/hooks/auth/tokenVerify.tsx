import axios from "axios";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { setAuth } from "../../redux/auth/authSlice";

const runtimeBackend =
  window?.runtimeConfig?.BACKEND_URL &&
  window.runtimeConfig.BACKEND_URL.trim() !== ""
    ? window.runtimeConfig.BACKEND_URL
    : null;

// Fallback to build-time .env (Vite)
const viteBackend = import.meta.env.VITE_BACKEND_URL || "";

// Final backend URL
export const backendURL = runtimeBackend || viteBackend;

const TokenVerify = () => {
  const dispatch = useDispatch();
  const [auth, setAuthState] = useState<{ id: string; role: string } | null>(
    null
  );
  const [isLoading, setLoading] = useState(true);
  useEffect(() => {
    const verifyToken = async () => {
      console.log("verifying");
      try {
        const res = await axios.get(`${backendURL}/api/v1/verifyToken`, {
          withCredentials: true,
        });

        if (res.data.decoded) {
          const { id, role } = res.data.decoded;
          setAuthState({ id, role });
          dispatch(setAuth({ id, role }));
        } else {
          console.log("Token verification failed");
          setAuthState(null);
        }
      } catch (err) {
        console.error("Error verifying token: ", err);
        setAuthState(null);
      } finally {
        setLoading(false);
      }
    };

    verifyToken();
  }, [dispatch]);

  return { auth, isLoading };
};

export default TokenVerify;
