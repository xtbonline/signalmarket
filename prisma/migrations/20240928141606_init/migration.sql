-- CreateTable
CREATE TABLE
    `users` (
        `id` VARCHAR(191) NOT NULL,
        `name` VARCHAR(191) NOT NULL,
        `email` VARCHAR(191) NOT NULL,
        `password` VARCHAR(191) NOT NULL,
        `phoneNumber` VARCHAR(191) NOT NULL DEFAULT '',
        `isAdmin` BOOLEAN NOT NULL DEFAULT false,
        `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        `account_status` VARCHAR(191) NOT NULL DEFAULT '',
        UNIQUE INDEX `users_email_key` (`email`),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
    `stats` (
        `id` VARCHAR(191) NOT NULL,
        `deposit` VARCHAR(191) NOT NULL DEFAULT '0',
        `earning` VARCHAR(191) NOT NULL DEFAULT '0',
        `balance` VARCHAR(191) NOT NULL DEFAULT '0',
        `withdraws` VARCHAR(191) NOT NULL DEFAULT '0',
        `userId` VARCHAR(191) NOT NULL,
        `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        `updatedAt` DATETIME (3) NOT NULL,
        UNIQUE INDEX `stats_userId_key` (`userId`),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
    `notifications` (
        `id` VARCHAR(191) NOT NULL,
        `title` VARCHAR(191) NOT NULL,
        `body` VARCHAR(191) NOT NULL,
        `userId` VARCHAR(191) NOT NULL,
        `opened` BOOLEAN NOT NULL DEFAULT false,
        `date` VARCHAR(191) NOT NULL,
        `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
    `latest-transactions` (
        `id` VARCHAR(191) NOT NULL,
        `userId` VARCHAR(191) NOT NULL,
        `amount` VARCHAR(191) NOT NULL,
        `status` BOOLEAN NOT NULL DEFAULT false,
        `date` VARCHAR(191) NOT NULL,
        `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE
    `deposits` (
        `id` VARCHAR(191) NOT NULL,
        `userId` VARCHAR(191) NOT NULL,
        `amount` VARCHAR(191) NOT NULL,
        `address` VARCHAR(191) NOT NULL,
        `recieved` BOOLEAN NOT NULL DEFAULT false,
        `date` VARCHAR(191) NOT NULL,
        `createdAt` DATETIME (3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
        PRIMARY KEY (`id`)
    ) DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `stats` ADD CONSTRAINT `stats_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `notifications` ADD CONSTRAINT `notifications_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `latest-transactions` ADD CONSTRAINT `latest-transactions_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `deposits` ADD CONSTRAINT `deposits_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;