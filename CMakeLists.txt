cmake_minimum_required(VERSION 3.16)

project(Rubik VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)


#-DCMAKE_TOOLCHAIN_FILE:PATH=/Volumes/T3/Dev/qt/official_qt/6.0.3/ios/lib/cmake/Qt6/qt.toolchain.cmake -DCMAKE_OSX_ARCHITECTURES:STRING=arm64
#-DCMAKE_OSX_SYSROOT:STRING=iphoneos in /Volumes/T3/Dev/projects/builds/build-ios_cmake_empty_quick_project_6_0_3-Qt_6_0_3_for_iOS

#find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Quick3D 3DCore)

qt_standard_project_setup()


set(SOURCES
    main.cpp
    c++/customqmlengine.cpp
    c++/clickableentity.cpp
    c++/mytestclass.cpp)
set(HEADERS
    c++/customqmlengine.h
    c++/clickableentity.h
    c++/mytestclass.h)

qt_add_executable(appRubik
    ${SOURCES} ${HEADERS}
)

qt_add_qml_module(appRubik
    URI Rubik
    VERSION 1.0
    QML_FILES Main.qml
        comps/Cube.qml
        comps/SOrbitCameraController.qml
        comps/StyledButton.qml
        controls/ControlsView.qml
        controls/CubeControls.qml
        controls/OrientationGrid.qml
        views/CubeView.qml
        views/GameMenu.qml
        views/CreateCubeView.qml
        logic/logic.js
        MainView.qml
    RESOURCES
        #assets/untitled.obj
        #assets/untitled.fbx
        assets/meshes/cube.mesh
        assets/untitled.glb
        .gitignore
        textures/tex.png
    )

#set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")
#set(CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "suleman.ahmed1990@gmail.com")


set_target_properties(appRubik PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.rubik.app
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appRubik
    PRIVATE Qt6::Quick
    PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Quick
    Qt::Quick3D
    Qt::3DCore
)

install(TARGETS appRubik
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
