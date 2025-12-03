-- Создание таблицы категорий оборудования
CREATE TABLE EquipmentCategory (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL UNIQUE,  -- Название категории
    Description NVARCHAR(500)   -- Описание
);

-- Создание основной таблицы оборудования
CREATE TABLE LaboratoryEquipment (
    EquipmentID INT IDENTITY(1,1) PRIMARY KEY,
    InventoryNumber NVARCHAR(50) NOT NULL UNIQUE,  -- Инвентарный номер
    FactoryNumber NVARCHAR(50),                   -- Заводской номер
    EquipmentName NVARCHAR(200) NOT NULL,       -- Наименование оборудования
    CategoryID INT NOT NULL,                    -- Ссылка на категорию
    Manufacturer NVARCHAR(100),                 -- Производитель
    Model NVARCHAR(100),                        -- Модель
    TechnicalSpecs NVARCHAR(MAX),                -- Технические характеристики
    Purpose NVARCHAR(300),                      -- Назначение
    FunctionalFeatures NVARCHAR(500),           -- Функциональные особенности
    InternetLink NVARCHAR(500),               -- Ссылка на страницу в интернете
    YearOfManufacture INT,                      -- Год выпуска
    PurchaseDate DATE,                          -- Дата приобретения
    WarrantyEndDate DATE,                       -- Окончание гарантии
    ServiceLifeYears INT,                       -- Срок службы (лет)
    CurrentStatus NVARCHAR(50) NOT NULL         -- Статус
        CHECK (CurrentStatus IN (N'рабочее', N'требует ремонта', N'в ремонте', N'списано', N'консервация')),
    Location NVARCHAR(100) NOT NULL,            -- Место размещения (здание/корпус)
    RoomNumber NVARCHAR(20),                     -- Номер помещения
    ResponsiblePerson NVARCHAR(100),          -- Ответственное лицо
    PowerRequirements NVARCHAR(100),           -- Требования к электропитанию
    VoltageV INT,                               -- Напряжение (В)
    PowerW INT,                                 -- Мощность (Вт)
    LengthCM DECIMAL(8,2),                     -- Длина (см)
    WidthCM DECIMAL(8,2),                      -- Ширина (см)
    HeightCM DECIMAL(8,2),                     -- Высота (см)
    WeightKG DECIMAL(8,3),                     -- Вес (кг)
    InstallationRequirements NVARCHAR(300),     -- Требования к установке
    SafetyRequirements NVARCHAR(300),         -- Требования безопасности
    RequiredUtilities NVARCHAR(200),         -- Необходимые коммуникации (вода, газ и т.п.)
    CertificationData NVARCHAR(300),           -- Данные о сертификации
    DocumentPurchase NVARCHAR(200),           -- Документ приобретения (номер договора)
    DocumentAcceptance NVARCHAR(200),        -- Документ приёма (номер акта)
    LastMaintenanceDate DATE,                    -- Последняя дата ТО
    NextMaintenanceDate DATE,                   -- Следующая дата ТО
    MaintenanceHistory NVARCHAR(MAX),          -- История технического обслуживания
    Notes NVARCHAR(1000),                     -- Примечания
    CreatedAt DATETIME DEFAULT GETDATE(),       -- Дата создания записи
    UpdatedAt DATETIME DEFAULT GETDATE()        -- Дата обновления записи

    CONSTRAINT FK_Equipment_Category 
        FOREIGN KEY (CategoryID)
        REFERENCES EquipmentCategory(CategoryID)
);

-- Индексы для оптимизации запросов
CREATE INDEX IX_LaboratoryEquipment_InventoryNumber
ON LaboratoryEquipment(InventoryNumber);

CREATE INDEX IX_LaboratoryEquipment_CategoryID
ON LaboratoryEquipment(CategoryID);

CREATE INDEX IX_LaboratoryEquipment_Location
ON LaboratoryEquipment(Location);

CREATE INDEX IX_LaboratoryEquipment_CurrentStatus
ON LaboratoryEquipment(CurrentStatus);
