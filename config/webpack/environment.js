const { environment } = require('@rails/webpacker')
//tells webpack to put in jquery and popper.js
//exports environment

const webpack = require('webpack'); 
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
); 
module.exports = environment
