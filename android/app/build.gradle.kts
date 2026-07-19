import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localProperties.load(FileInputStream(localPropertiesFile))
}

fun readEnvValue(key: String): String {
    localProperties.getProperty(key)?.let {
        if (it.isNotBlank()) return it
    }
    val envFile = rootProject.file("../.env")
    if (envFile.exists()) {
        envFile.readLines().forEach { line ->
            val trimmed = line.trim()
            if (trimmed.startsWith("$key=")) {
                return trimmed.substringAfter("=").trim()
            }
        }
    }
    return ""
}

val googleWebClientId = readEnvValue("GOOGLE_OAUTH_CLIENT_ID")

// Write Google/auth strings as resources (avoids AGP resValues feature flags).
val generatedValues = file("src/main/res/values/generated_config.xml")
generatedValues.parentFile.mkdirs()
generatedValues.writeText(
    """
    |<?xml version="1.0" encoding="utf-8"?>
    |<resources>
    |    <string name="app_name">Terrava</string>
    |    <string name="default_web_client_id" translatable="false">$googleWebClientId</string>
    |</resources>
    """.trimMargin(),
)

android {
    namespace = "com.terrava.terrava"
    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.terrava.terrava"
        minSdk = maxOf(flutter.minSdkVersion, 23)
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))
    implementation("com.google.firebase:firebase-messaging")
}
