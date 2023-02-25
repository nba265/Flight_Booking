package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;

import static java.time.temporal.TemporalAdjusters.firstDayOfYear;
import static java.time.temporal.TemporalAdjusters.lastDayOfYear;

@Service
public class PaymentService {
    @Autowired
    PaymentRepository paymentRepository;

    public double total() {
        if (paymentRepository.sum() == null) {
            return 0;
        }
        return paymentRepository.sum();
    }

    public double totalIncomeThisMonth() {
        LocalDate startDate = LocalDate.now().withDayOfMonth(1);
        LocalDate endDate = LocalDate.now().with(TemporalAdjusters.lastDayOfMonth());
        if (paymentRepository.getSumIncome(startDate, endDate) == null) {
            return 0;
        }
        return paymentRepository.getSumIncome(startDate, endDate);
    }

    public double totalIncomeToday() {
        LocalDate startDate = LocalDate.now();
        LocalDate endDate = LocalDate.now();
        if (paymentRepository.getSumIncome(startDate, endDate) == null) {
            return 0;
        }
        return paymentRepository.getSumIncome(startDate, endDate);
    }

    public double totalIncomeThisYear() {
        LocalDate now = LocalDate.now();
        LocalDate firstDay = now.with(firstDayOfYear());
        LocalDate lastDay = now.with(lastDayOfYear());
        if (paymentRepository.getSumIncome(firstDay, lastDay) == null) {
            return 0;
        }
        return paymentRepository.getSumIncome(firstDay, lastDay);
    }
}
