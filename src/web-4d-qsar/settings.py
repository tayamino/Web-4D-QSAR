"""
Django settings for qsar project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

from decouple import config
from dj_database_url import parse

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = config(
    'SECRET_KEY',
    default='#g2zl-73%y5&%5shqdtblk(!q7qus0651kdt5@s+hmo_ku)bj-'
)

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = config('DEBUG', default=True, cast=bool)

TEMPLATE_DEBUG = DEBUG

ALLOWED_HOSTS = config('ALLOWED_HOSTS', default=[], cast=list)


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',

    # Third-party apps
    'widget_tweaks',

    # Main apps
    'core',
    'dynamics',
    'matrix_generate',
    'users',
)

if DEBUG:
    INSTALLED_APPS += (
        'debug_toolbar',
    )

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
)

ROOT_URLCONF = 'web-4d-qsar.urls'

WSGI_APPLICATION = 'web-4d-qsar.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': config(
        'DATABASE_URL',
        default='sqlite:///' + os.path.join(BASE_DIR, 'db.sqlite3'),
        cast=parse
    )
}

AUTH_USER_MODEL = 'users.MyUser'

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static-root')

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

# TEMPLATE_DIRS = (
#     os.path.join(BASE_DIR, 'templates'),
# )

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# Tasks settings
WEB_4D_QSAR_STATIC_DIR  = os.path.join(BASE_DIR, 'files/static')
TOPOLBUILD_DIR = '/opt/topolbuild1_3'
#GROMACS_DIR = '/usr/local/gromacs/bin'
GROMACS_DIR = '/opt/web4d-qsar'
GROMACS_MPI = False

# Celery settings
CELERY_OFF = False
BROKER_URL = 'amqp://guest:guest@localhost:5672//'
# CELERYD_CONCURRENCY = 4

# E-mail settings
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'fpt.qsar@gmail.com'
EMAIL_HOST_PASSWORD = 'Web4DqsarFPT'
EMAIL_PORT = 587
