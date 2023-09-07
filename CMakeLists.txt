cmake_minimum_required(VERSION 3.16)

project(Rubik VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Quick3D)

qt_add_executable(appRubik
    main.cpp
)

qt_add_qml_module(appRubik
    URI Rubik
    VERSION 1.0
    QML_FILES Main.qml
        comps/Cube.qml
        assets/FullCube.qml
        comps/SOrbitCameraController.qml
    RESOURCES
    #assets/untitled.obj
    #assets/untitled.fbx
    assets/meshes/cube.mesh
    QML_FILES controls/OrientationGrid.qml
    RESOURCES .gitignore
)

set_target_properties(appRubik PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
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
)

install(TARGETS appRubik
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
