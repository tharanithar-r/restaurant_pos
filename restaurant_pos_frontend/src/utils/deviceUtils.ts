// Function to get or generate a device ID
export const getDeviceId = (): string => {
  // Check if we already have a device ID in localStorage
  let deviceId = localStorage.getItem('deviceId');
  
  // If not, generate a new one and store it
  if (!deviceId) {
    deviceId = generateDeviceId();
    localStorage.setItem('deviceId', deviceId);
  }
  
  return deviceId;
};

// Function to generate a unique device ID
const generateDeviceId = (): string => {
  // Use crypto API if available
  if (typeof crypto !== 'undefined' && crypto.randomUUID) {
    return crypto.randomUUID();
  }
  
  // Fallback to timestamp-based ID
  return 'device_' + Date.now() + '_' + Math.random().toString(36).substr(2, 9);
};

// Function to get device information (optional, for more detailed tracking)
export const getDeviceInfo = (): string => {
  const userAgent = navigator.userAgent;
  const platform = navigator.platform;
  const language = navigator.language;
  
  return `${platform}_${language}_${userAgent.substring(0, 50)}`;
};
