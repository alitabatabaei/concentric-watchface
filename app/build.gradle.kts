plugins {
    alias(libs.plugins.android.application)
}

android {
    namespace = "com.tabatabaei.concentricwatchface"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.tabatabaei.concentricwatchface"
        minSdk = 33
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        debug {
            isMinifyEnabled = true
        }
        release {
            isMinifyEnabled = true
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
