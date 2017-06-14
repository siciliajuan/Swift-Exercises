//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let title = "Go fast elliptical machine 9000"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
    return exercise.caloriesBurned / exercise.minutes
}

print(caloriesBurnedPerMinute(exercise: ellipticalWorkout))
print(caloriesBurnedPerMinute(exercise: runningWorkout))

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

// Default implementation of protocols with protocol extensions

extension ExerciseType {
    var description: String {
        return "Exercise (\(name)), burned \(caloriesBurned) calories in \(minutes) minutes"
    }
}

print(ellipticalWorkout)
print(runningWorkout)

extension Treadmill {
    var description: String {
        return "Treadmill (\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes)"
    }
}

extension ExerciseType {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]

for exercise in mondayWorkout {
    print(exercise.title)
}

print(ellipticalWorkout.title)