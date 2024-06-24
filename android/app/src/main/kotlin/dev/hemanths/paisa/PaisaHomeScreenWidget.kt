package dev.hemanths.paisa

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.SharedPreferences
import android.graphics.BitmapFactory
import android.graphics.Color
import android.os.Build
import android.provider.CalendarContract.Colors
import android.view.View
import android.widget.RemoteViews
import androidx.core.graphics.toColorInt
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetPlugin
import es.antonborri.home_widget.HomeWidgetProvider
import java.math.BigInteger

/**
 * Implementation of App Widget functionality.
 */
class PaisaHomeScreenWidget : HomeWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        appWidgetIds.forEach { widgetId ->

            val views = RemoteViews(context.packageName, R.layout.paisa_home_screen_widget).apply {
                /*val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                    context,
                    MainActivity::class.java
                )
                setOnClickPendingIntent(R.id.background, pendingIntent)*/
                val expense = widgetData.getString("expense", "$0");
                val income = widgetData.getString("income", "$0");
                val total = widgetData.getString("total", "$0");
                val primaryColor = widgetData.getInt("bgColor", 0)
                val onPrimaryColor = widgetData.getInt("textColor", 0)
                setTextViewText(R.id.expenseText, expense)
                setTextViewText(R.id.incomeText, income)
                setTextViewText(R.id.totalText, total)
                val bgColor = Color.valueOf(primaryColor).toArgb()
                val color = Color.valueOf(onPrimaryColor).toArgb()
                setInt(R.id.background, "setBackgroundColor", bgColor)
                setInt(R.id.expenseText, "setTextColor", color)
                setInt(R.id.incomeText, "setTextColor", color)
                setInt(R.id.totalText, "setTextColor", color)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }

}