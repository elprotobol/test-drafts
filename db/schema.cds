using { cuid, sap.common.CodeList } from '@sap/cds/common';

namespace db;



/**Entidad de Prueba */
entity Students : cuid {
    numberDocument : String(10);
    firstName      : String;
    lastName       : String;
    fullName       : String = firstName || ' ' || lastName;
};

entity Employees : cuid {
    fullName : String;
};

entity Shifts : CodeList {
    key code  : String enum {
            D;
            V;
            N;
            DV
        };
        name  : String @UI.Hidden;
        descr : String @UI.Hidden;
};


entity Sections : cuid {
    section : String;
};
/** Curriculos Escolares por Grados */
entity AcademicResumes : cuid {
    resume         : String;
};

entity Subjects : cuid {
    course      : String;
    subject     : String(80);
    numberHours : Int16;
    resume      : Association to AcademicResumes;
};

// Entidad para los Periodos Escolares
entity SchoolPeriods : cuid {
    schoolPeriod : String;
    beginDate    : Date;
    endDate      : Date;
    statu        : String
};

entity EUAssignments : cuid {
    degree       : Association to AcademicResumes;
    toSections   : Composition of many EUSections
                       on toSections.assignment = $self;
    schoolPeriod : Association to SchoolPeriods;
};

entity EUSections : cuid {
    section    : Association to Sections;
    shift      : Association to Shifts;
    assignment : Association to EUAssignments;
    toDegrees  : Composition of many EUStudents
                     on toDegrees.section = $self; // Salones por grado
    toTeachers : Composition of many EUTeachers
                     on toTeachers.section = $self; // Profesores por grado
    toStudents : Composition of many EUStudents
                     on toStudents.section = $self; // Estudiantes por grado
};

entity EUTeachers : cuid {
    subject : Association to Subjects;
    teacher : Association to Employees;
    hours   : Int16;
    section : Association to EUSections;
};

entity EUStudents : cuid {
    student : Association to Students;
    section : Association to EUSections;
};