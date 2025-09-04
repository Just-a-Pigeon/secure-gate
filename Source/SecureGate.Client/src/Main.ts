/* import the fontawesome core and component*/
import '@/styles/style.css';
import { createPinia } from 'pinia';
import { createApp } from 'vue';
import App from '@/App.vue';
import i18n from '@/localization/Resources';
import router from '@/router/Index';
import { authService } from '@/services/AuthService';
import type { UserResponseDto } from '@/types/auth/UserResponseDto';

const { fetch: originalFetch } = window;

window.fetch = async (...args) => {
    const response = await originalFetch(...args);

    if (response.status === 401)
        window.location.href = '/login?redirectUrl=' + window.location.pathname;
    else if (response.status === 500)
        throw new Error(`An error has occurred: ${response.status} - ${response.statusText}`);

    return response;
};

const runApp = async () => {
    const user: UserResponseDto = await authService.getUser();

    const app = createApp(App);
    app.use(i18n(user.language ?? 'nl'));
    app.use(router);
    app.use(createPinia());
    app.mount('#app');
    
};

runApp().then();
