//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Aaron Makaruk on 1/20/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WeekForecast(dateRange: "Jan 10 - 17", avgLow: 75, avgHigh: 80)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                }
            }
        }
    }
}

struct WeekForecast: View {
    let dateRange: String
    let avgLow: Int
    let avgHigh: Int

    var avgLowColor: Color {
        if avgLow < 80 {
            return .blue
        } else {
            return .black
        }
    }

    var avgHighColor: Color {
        if avgHigh > 75 {
            return .red
        } else {
            return .black
        }
    }

    var body: some View {
        VStack {
            Text(dateRange)
                .font(.largeTitle)
            HStack {
                Text("Average Low: \(avgLow)")
                    .foregroundStyle(avgLowColor)
                Text("Average High: \(avgHigh)")
                    .foregroundStyle(avgHighColor)
            }
        }
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int

    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }

    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }

    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)º")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(.secondary)
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
