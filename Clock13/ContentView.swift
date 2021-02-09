//
//  ContentView.swift
//  Clock13
//
//  Created by Richard on 9/2/2021.
//

import SwiftUI


struct ContentView: View {
    @State var date = Date()
    @State var year: String = ""
    @State var month: String = ""
    @State var day: String = ""
    @State var hour: String = ""
    @State var min: String = ""
    @State var second: String = ""
    
    var body: some View {
        VStack {
            HStack {
                HStack(alignment: .center, spacing: 2, content: {
                    Text(year)
                    Text("-").font(.system(size: 30))
                    Text(month)
                    Text("-").font(.system(size: 30))
                    Text(day)
                }).font(Font.custom("Clairvo-Regular", size: 80))
                Text(" ")
                HStack(alignment: .center, spacing: 2, content:{
                    Text(hour)
                    Text(":").font(.system(size: 30))
                    Text(min)
                    Text(":").font(.system(size: 30))
                    Text(second)
                }).font(Font.custom("Clairvo-Regular", size: 80))
                
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 8.0, alignment: .center)
            
            HStack {
                HStack(alignment: .center, spacing: 2, content: {
                    Text(year)
                    Text("-")
                    Text(month)
                    Text("-")
                    Text(day)
                }).font(.system(size: 35))
                Text(" ")
                HStack(alignment: .center, spacing: 2, content: {
                    Text(hour)
                    Text(":")
                    Text(min)
                    Text(":")
                    Text(second)
                }).font(.system(size: 35))
                    
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight / 8.0, alignment: .center)
            .onAppear(perform: {
                        let _ = self.updateTimer}
            )
            Image("rule")
                .resizable()
                .frame(width: 370, height: 350, alignment: .center)
        }
    }
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }
    
    func timeString(date: Date) -> String {
         let time = timeFormat.string(from: date)
         return time
    }
    
    var updateTimer: Timer {
       let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true,  block: {_ in
            self.date = Date()
            format(date)
        })
        RunLoop.current.add(timer, forMode: .common)
        timer.fire()
        return timer
    }
    
    func format(_ date: Date) {
         year = date.get(.year)
         month =  date.get(.month)
         day = date.get(.day)

         hour = date.get(.hour)
         min = date.get(.minute)
         second = date.get(.second)
    }
    


}

extension Date {
    func get(_ type: Calendar.Component)-> String {
        let calendar = Calendar.current
        let t = calendar.component(type, from: self)
        return (t < 10 ? "0\(t)" : t.description)
    }
}


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
