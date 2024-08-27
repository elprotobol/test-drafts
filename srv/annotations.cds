using { CatalogService as call } from './service';


annotate call.StudentInscriptions with @odata.draft.enabled @(
    UI  : {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : degree_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : schoolPeriod_ID,
            },
        ],


        FieldGroup  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : schoolPeriod_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : degree_ID,
                },
            ],
        },

        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'toSections/@UI.LineItem',
            },
        ],
    }
);


annotate call.StudentSections with @(
    UI: {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : shift_code,
            },
            {
                $Type : 'UI.DataField',
                Value : section_ID,
            },
        ],

        FieldGroup  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : shift_code,
                },
                {
                    $Type : 'UI.DataField',
                    Value : section_ID,
                },
                
            ],
        },


        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'toStudents/@UI.LineItem',
            },
        ],
    }
);


annotate call.StudentSet with @(
    UI : {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : student_ID,
            },
        ],
    }
);



annotate call.teacherSelected  with  @(
     
    UI  : {
        
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : degree_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : schoolPeriod_ID,
            },
        ],


        FieldGroup  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : schoolPeriod_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : degree_ID,
                },
            ],
        },

        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'toSections/@UI.LineItem',
            },
        ],
    }
);


annotate call.TeacherSections with @(
    UI: {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : shift_code,
            },
            {
                $Type : 'UI.DataField',
                Value : section_ID,
            },
        ],

        FieldGroup  : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : shift_code,
                },
                {
                    $Type : 'UI.DataField',
                    Value : section_ID,
                },
                
            ],
        },


        Facets  : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Target : 'toTeachers/@UI.LineItem',
            },
        ],
    }
);


annotate call.TeacherSet with @(
    UI : {
        LineItem  : [
            {
                $Type : 'UI.DataField',
                Value : teacher_ID,
            },
        ],
    }
);