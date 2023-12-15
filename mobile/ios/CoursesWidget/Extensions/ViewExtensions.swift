//
//  ViewExtensions.swift
//  CoursesWidgetExtension
//
//  Created by Yazeed AlKhalaf on 15/12/2023.
//

import SwiftUI

extension View {
    func widgetBackground(_ backgroundView: some View) -> some View {
        if #available(iOSApplicationExtension 17.0, *) {
            return containerBackground(for: .widget) {
                backgroundView
            }
        } else {
            return background(backgroundView)
        }
    }
}
