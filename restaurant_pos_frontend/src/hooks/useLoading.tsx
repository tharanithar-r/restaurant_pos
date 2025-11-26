import { useCallback } from "react";
import { useDispatch } from "react-redux";
import { setStateLoading, clearStateLoading } from "../redux/loadingSlice";
import { useScrollPosition } from "./useScrollPosition";

export const useLoadingAction = () => {
  const dispatch = useDispatch();
  const { saveScrollPosition, restoreScrollPosition } = useScrollPosition();

  const withLoading = useCallback(
    async <T,>(
      action: () => Promise<T>,
      stateName: string,
      timeoutMs: number = 10000
    ): Promise<T> => {
      // Set up timeout to prevent infinite loading
      const timeoutId = setTimeout(() => {
        console.warn(`Loading timeout exceeded for ${stateName}`);
        dispatch(clearStateLoading(stateName));
      }, timeoutMs);

      try {
        saveScrollPosition();
        dispatch(setStateLoading(stateName));
        const result = await action();

        // Clear timeout if action completes successfully
        clearTimeout(timeoutId);

        requestAnimationFrame(() => {
          dispatch(clearStateLoading(stateName));
          restoreScrollPosition();
        });
        return result;
      } catch (error) {
        // Clear timeout if action fails
        clearTimeout(timeoutId);

        console.error("Action failed:", error);
        dispatch(clearStateLoading(stateName));
        throw error;
      }
    },
    [dispatch, saveScrollPosition, restoreScrollPosition]
  );

  return { withLoading };
};
