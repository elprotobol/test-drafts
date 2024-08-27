using { db as call } from '../db/schema';



service CatalogService @(path : '/CatalogService') {

    entity StudentInscriptions as projection on call.EUAssignments;

    entity StudentSections as projection on call.EUSections{
        ID,
        section,
        shift,
        assignment,
        toStudents
    };

    entity StudentSet as projection on call.EUStudents;

    
    @cds.redirection.target
    entity teacherSelected as projection on call.EUAssignments;
    @cds.redirection.target
    entity TeacherSections as projection on call.EUSections{
        ID,
        section,
        shift,
        assignment,
        toTeachers as Teacher : redirected to TeacherSet
    };

    entity TeacherSet as projection on call.EUTeachers;


}