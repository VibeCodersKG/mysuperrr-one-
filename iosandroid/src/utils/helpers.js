/**
 * Утилиты для безопасного преобразования типов
 */

/**
 * Безопасное преобразование в boolean
 * Решает проблему java.lang.String cannot be cast to java.lang.Boolean
 * @param {any} value - Значение для преобразования
 * @returns {boolean}
 */
export const toBool = (value) => {
  if (typeof value === 'boolean') return value;
  if (typeof value === 'string') return value.toLowerCase() === 'true';
  if (typeof value === 'number') return value !== 0;
  return Boolean(value);
};

/**
 * Нормализация объекта пользователя с backend
 * Преобразует строковые boolean в настоящие boolean
 * @param {Object} userData - Данные пользователя с backend
 * @returns {Object} Нормализованные данные
 */
export const normalizeUserData = (userData) => {
  if (!userData) return null;

  return {
    ...userData,
    administrator: toBool(userData.administrator),
  };
};

/**
 * Нормализация данных устройства
 * @param {Object} deviceData - Данные устройства с backend
 * @returns {Object} Нормализованные данные
 */
export const normalizeDeviceData = (deviceData) => {
  if (!deviceData) return null;

  return {
    ...deviceData,
    disabled: toBool(deviceData.disabled),
  };
};
