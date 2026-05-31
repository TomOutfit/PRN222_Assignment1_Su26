// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

// Additional validation functions for FUNews Management System
(function() {
    'use strict';

    // Form validation enhancements
    window.FUNewsValidation = {
        validateNewsForm: function(form) {
            let isValid = true;
            
            // Validate title
            const title = form.querySelector('#NewsTitle');
            if (title && title.value.trim().length < 5) {
                title.classList.add('is-invalid');
                isValid = false;
            } else if (title) {
                title.classList.remove('is-invalid');
            }
            
            // Validate content
            const content = form.querySelector('#NewsContent');
            if (content && content.value.trim().length < 20) {
                content.classList.add('is-invalid');
                isValid = false;
            } else if (content) {
                content.classList.remove('is-invalid');
            }
            
            // Validate category
            const category = form.querySelector('#CategoryID');
            if (category && !category.value) {
                category.classList.add('is-invalid');
                isValid = false;
            } else if (category) {
                category.classList.remove('is-invalid');
            }
            
            return isValid;
        },
        
        validateAccountForm: function(form) {
            let isValid = true;
            
            // Validate name
            const name = form.querySelector('#AccountName');
            if (name && name.value.trim().length < 3) {
                name.classList.add('is-invalid');
                isValid = false;
            } else if (name) {
                name.classList.remove('is-invalid');
            }
            
            // Validate email
            const email = form.querySelector('#AccountEmail');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email && !emailRegex.test(email.value)) {
                email.classList.add('is-invalid');
                isValid = false;
            } else if (email) {
                email.classList.remove('is-invalid');
            }
            
            // Validate password for new accounts
            const password = form.querySelector('#AccountPassword');
            const isEditForm = !!form.querySelector('#AccountID');
            if (password && (!isEditForm || password.value)) {
                if (password.value.length < 6) {
                    password.classList.add('is-invalid');
                    isValid = false;
                } else {
                    password.classList.remove('is-invalid');
                }
            }
            
            return isValid;
        },
        
        validateCategoryForm: function(form) {
            let isValid = true;
            
            // Validate name
            const name = form.querySelector('#CategoryName');
            if (name && name.value.trim().length < 2) {
                name.classList.add('is-invalid');
                isValid = false;
            } else if (name) {
                name.classList.remove('is-invalid');
            }
            
            return isValid;
        }
    };

    // Initialize validation on document ready
    document.addEventListener('DOMContentLoaded', function() {
        // Add custom validation to forms
        const newsForms = document.querySelectorAll('form[action*="CreateNews"], form[action*="EditNews"]');
        newsForms.forEach(form => {
            form.addEventListener('submit', function(e) {
                if (!window.FUNewsValidation.validateNewsForm(form)) {
                    e.preventDefault();
                    e.stopPropagation();
                }
            });
        });
        
        const accountForms = document.querySelectorAll('form[action*="CreateAccount"], form[action*="EditAccount"]');
        accountForms.forEach(form => {
            form.addEventListener('submit', function(e) {
                if (!window.FUNewsValidation.validateAccountForm(form)) {
                    e.preventDefault();
                    e.stopPropagation();
                }
            });
        });
        
        const categoryForms = document.querySelectorAll('form[action*="CreateCategory"], form[action*="EditCategory"]');
        categoryForms.forEach(form => {
            form.addEventListener('submit', function(e) {
                if (!window.FUNewsValidation.validateCategoryForm(form)) {
                    e.preventDefault();
                    e.stopPropagation();
                }
            });
        });
    });
})();
