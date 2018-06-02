module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)

type alias Grade = Int
type alias Student = String
type alias School = Dict Int (List Student)

empty : School
empty =
    Dict.empty

addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    let
      update existing =
        case existing of
          Nothing ->
            Just [student]
          Just students ->
            Just (List.sort (student :: students))
    in
      Dict.update grade update school

studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case Dict.get grade school of
      Nothing ->
        []
      Just list ->
        list

allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
