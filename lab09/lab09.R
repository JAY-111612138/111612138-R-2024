install.packages("plumber")
library(plumber)
options(repos = "https://cran.csie.ntu.edu.tw/")

students <- list()
student_id <- 0  


get_new_id <- function() {
  student_id <<- student_id + 1
  return(student_id)
}

# GET /students retrieves a list of students as an array of objects.
#* @get /students
function() {
  return(students)
}

# POST /students allows adding a student by providing name, height,
# and weight. The system automatically assigns an id.
#* @param name The name of the student
#* @param height The height of the student
#* @param weight The weight of the student
#* @post /students
function(name, height, weight) {
  new_student <- list(
    id = get_new_id(),
    name = name,
    height = as.numeric(height),
    weight = as.numeric(weight)
  )
  students[[length(students) + 1]] <<- new_student
  return(new_student)
}

# PATCH /students/:id enables editing the name, height, and weight of
# a student.
#* @param id The ID of the student to edit
#* @param name (optional) The new name of the student
#* @param height (optional) The new height of the student
#* @param weight (optional) The new weight of the student
#* @patch /students/<id>
function(id, name = NULL, height = NULL, weight = NULL) {
  id <- as.integer(id)
  for (i in seq_along(students)) {
    if (!is.null(students[[i]]) && students[[i]]$id == id) {
      if (!is.null(name)) students[[i]]$name <- name
      if (!is.null(height)) students[[i]]$height <- as.numeric(height)
      if (!is.null(weight)) students[[i]]$weight <- as.numeric(weight)
      return(students[[i]])
    }
  }
  return(list(error = "Student not found"))
}

# DELETE /students/:id deletes a student by their id.
#* @param id The ID of the student to delete
#* @delete /students/<id>
function(id) {
  id <- as.integer(id)
  for (i in seq_along(students)) {
    if (!is.null(students[[i]]) && students[[i]]$id == id) {
      students[[i]] <<- NULL
      return(list(message = paste("Student with ID", id, "deleted successfully")))
    }
  }
  return(list(error = "Student not found"))
}

# GET /plot generates a plot of height versus weight.
#* @get /plot
#* @serializer png
function() {
  valid_students <- Filter(Negate(is.null), students)  # 過濾掉 NULL 資料
  if (length(valid_students) == 0) {
    plot.new()
    text(0.5, 0.5, "No students data available!", cex = 1.5)
  } else {
    heights <- sapply(valid_students, function(x) x$height)
    weights <- sapply(valid_students, function(x) x$weight)
    plot(heights, weights, xlab = "Height", ylab = "Weight", main = "Height vs Weight")
  }
}
