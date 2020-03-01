const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
    theme: {
        extend: {
            fontSize: {
                'xs': '1.125rem',
                'sm': '1.25rem',
                'base': '1.5rem',
                'lg': '1.875rem',
                'xl': '2.25rem',
                '2xl': '3rem',
                '3xl': '4rem',
                '4xl': '5rem',
                '5xl': '6rem',
            },
            fontFamily: {
                serif: ['Zilla Slab', ...defaultTheme.fontFamily.serif],
                sans: ['Inter var', ...defaultTheme.fontFamily.sans],
            },
        },
    },
    variants: {
        backgroundColor: ['hover', 'focus', 'even', 'odd']
    },
    plugins: [
        require('@tailwindcss/ui')
    ],
};
